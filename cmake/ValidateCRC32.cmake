function(vaildate_crc32 file)
  if (NOT EXISTS ${file})
    message(FATAL_ERROR "File ${file} does not exist. Probably the CRC32 in the file name was changed.")
  endif()

  execute_process(COMMAND crc32 ${file} RESULT_VARIABLE result OUTPUT_VARIABLE output)
  string(REGEX REPLACE "\n$" "" output "${output}")
  if (NOT ${result} EQUAL 0 OR "${output}" MATCHES "BAD")
    message(FATAL_ERROR "CRC32 missmatch ${output} for file: ${file}")
  endif()
endfunction()
