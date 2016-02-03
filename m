From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 17:34:40 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
 installed programs
In-Reply-To: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <20160203173440.6d0567d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Izard,

On Wed,  3 Feb 2016 12:14:48 +0100, Romain Izard wrote:

> +menuconfig BR2_PACKAGE_COREUTILS_SELECT
> +	bool "Override the default set of installed coreutils"
> +	depends on BR2_PACKAGE_COREUTILS
> +
> +if BR2_PACKAGE_COREUTILS_SELECT
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SQUARE_BRACKET
> +	bool "["
> +	help
> +	  check file types and compare values
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_ARCH
> +	bool "arch"
> +	help
> +	  print machine hardware name (same as uname -m)
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_BASE32
> +	bool "base32"
> +	help
> +	  base32 encode/decode data and print to standard output
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_BASE64
> +	bool "base64"
> +	help
> +	  base64 encode/decode data and print to standard output
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_BASENAME
> +	bool "basename"
> +	help
> +	  strip directory and suffix from filenames
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CAT
> +	bool "cat"
> +	help
> +	  concatenate files and print on the standard output
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CHCON
> +	bool "chcon"
> +	help
> +	  change file security context
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CHGRP
> +	bool "chgrp"
> +	help
> +	  change group ownership
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CHMOD
> +	bool "chmod"
> +	help
> +	  change file mode bits
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CHOWN
> +	bool "chown"
> +	help
> +	  change file owner and group
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CHROOT
> +	bool "chroot"
> +	help
> +	  run command or interactive shell with special root directory
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CKSUM
> +	bool "cksum"
> +	help
> +	  checksum and count the bytes in a file
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_COMM
> +	bool "comm"
> +	help
> +	  compare two sorted files line by line
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CP
> +	bool "cp"
> +	help
> +	  copy files and directories
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CSPLIT
> +	bool "csplit"
> +	help
> +	  split a file into sections determined by context lines
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_CUT
> +	bool "cut"
> +	help
> +	  remove sections from each line of files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_DATE
> +	bool "date"
> +	help
> +	  print or set the system date and time
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_DD
> +	bool "dd"
> +	help
> +	  convert and copy a file
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_DF
> +	bool "df"
> +	help
> +	  report file system disk space usage
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_DIR
> +	bool "dir"
> +	help
> +	  list directory contents
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_DIRCOLORS
> +	bool "dircolors"
> +	help
> +	  color setup for ls
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_DIRNAME
> +	bool "dirname"
> +	help
> +	  strip last component from file name
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_DU
> +	bool "du"
> +	help
> +	  estimate file space usage
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_ECHO
> +	bool "echo"
> +	help
> +	  display a line of text
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_ENV
> +	bool "env"
> +	help
> +	  run a program in a modified environment
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_EXPAND
> +	bool "expand"
> +	help
> +	  convert tabs to spaces
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_EXPR
> +	bool "expr"
> +	help
> +	  evaluate expressions
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_FACTOR
> +	bool "factor"
> +	help
> +	  factor numbers
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_FALSE
> +	bool "false"
> +	help
> +	  do nothing, unsuccessfully
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_FMT
> +	bool "fmt"
> +	help
> +	  simple optimal text formatter
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_FOLD
> +	bool "fold"
> +	help
> +	  wrap each input line to fit in specified width
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_GROUPS
> +	bool "groups"
> +	help
> +	  print the groups a user is in
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_HEAD
> +	bool "head"
> +	help
> +	  output the first part of files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_HOSTID
> +	bool "hostid"
> +	help
> +	  print the numeric identifier for the current host
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_HOSTNAME
> +	bool "hostname"
> +	help
> +	  set or print the name of the current host system
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_ID
> +	bool "id"
> +	help
> +	  print real and effective user and group IDs
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_INSTALL
> +	bool "install"
> +	help
> +	  copy files and set attributes
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_JOIN
> +	bool "join"
> +	help
> +	  join lines of two files on a common field
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_KILL
> +	bool "kill"
> +	help
> +	  send signals to processes, or list signals
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_LINK
> +	bool "link"
> +	help
> +	  call the link function to create a link to a file
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_LN
> +	bool "ln"
> +	help
> +	  make links between files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_LOGNAME
> +	bool "logname"
> +	help
> +	  print user's login name
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_LS
> +	bool "ls"
> +	help
> +	  list directory contents
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_MD5SUM
> +	bool "md5sum"
> +	help
> +	  compute and check MD5 message digest
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_MKDIR
> +	bool "mkdir"
> +	help
> +	  make directories
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_MKFIFO
> +	bool "mkfifo"
> +	help
> +	  make FIFOs (named pipes)
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_MKNOD
> +	bool "mknod"
> +	help
> +	  make block or character special files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_MKTEMP
> +	bool "mktemp"
> +	help
> +	  create a temporary file or directory
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_MV
> +	bool "mv"
> +	help
> +	  move (rename) files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_NICE
> +	bool "nice"
> +	help
> +	  run a program with modified scheduling priority
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_NL
> +	bool "nl"
> +	help
> +	  number lines of files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_NOHUP
> +	bool "nohup"
> +	help
> +	  run a command immune to hangups, with output to a non-tty
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_NPROC
> +	bool "nproc"
> +	help
> +	  print the number of processing units available
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_NUMFMT
> +	bool "numfmt"
> +	help
> +	  Convert numbers from/to human-readable strings
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_OD
> +	bool "od"
> +	help
> +	  dump files in octal and other formats
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_PASTE
> +	bool "paste"
> +	help
> +	  merge lines of files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_PATHCHK
> +	bool "pathchk"
> +	help
> +	  check whether file names are valid or portable
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_PINKY
> +	bool "pinky"
> +	help
> +	  lightweight finger
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_PR
> +	bool "pr"
> +	help
> +	  convert text files for printing
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_PRINTENV
> +	bool "printenv"
> +	help
> +	  print all or part of environment
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_PRINTF
> +	bool "printf"
> +	help
> +	  format and print data
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_PTX
> +	bool "ptx"
> +	help
> +	  produce a permuted index of file contents
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_PWD
> +	bool "pwd"
> +	help
> +	  print name of current/working directory
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_READLINK
> +	bool "readlink"
> +	help
> +	  print resolved symbolic links or canonical file names
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_REALPATH
> +	bool "realpath"
> +	help
> +	  print the resolved path
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_RM
> +	bool "rm"
> +	help
> +	  remove files or directories
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_RMDIR
> +	bool "rmdir"
> +	help
> +	  remove empty directories
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_RUNCON
> +	bool "runcon"
> +	help
> +	  run command with specified security context
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SEQ
> +	bool "seq"
> +	help
> +	  print a sequence of numbers
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SHA1SUM
> +	bool "sha1sum"
> +	help
> +	  compute and check SHA1 message digest
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SHA224SUM
> +	bool "sha224sum"
> +	help
> +	  compute and check SHA224 message digest
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SHA256SUM
> +	bool "sha256sum"
> +	help
> +	  compute and check SHA256 message digest
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SHA384SUM
> +	bool "sha384sum"
> +	help
> +	  compute and check SHA384 message digest
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SHA512SUM
> +	bool "sha512sum"
> +	help
> +	  compute and check SHA512 message digest
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SHRED
> +	bool "shred"
> +	help
> +	  overwrite a file to hide its contents, and optionally delete it
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SHUF
> +	bool "shuf"
> +	help
> +	  generate random permutations
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SLEEP
> +	bool "sleep"
> +	help
> +	  delay for a specified amount of time
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SORT
> +	bool "sort"
> +	help
> +	  sort lines of text files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SPLIT
> +	bool "split"
> +	help
> +	  split a file into pieces
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_STAT
> +	bool "stat"
> +	help
> +	  display file or file system status
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_STDBUF
> +	bool "stdbuf"
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  run command with specified buffering settings
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_STTY
> +	bool "stty"
> +	help
> +	  change and print terminal line settings
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SUM
> +	bool "sum"
> +	help
> +	  checksum and count the blocks in a file
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_SYNC
> +	bool "sync"
> +	help
> +	  Synchronize cached writes to persistent storage
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TAC
> +	bool "tac"
> +	help
> +	  concatenate and print files in reverse
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TAIL
> +	bool "tail"
> +	help
> +	  output the last part of files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TEE
> +	bool "tee"
> +	help
> +	  read from standard input and write to standard output and files
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TEST
> +	bool "test"
> +	help
> +	  check file types and compare values
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TIMEOUT
> +	bool "timeout"
> +	help
> +	  run a command with a time limit
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TOUCH
> +	bool "touch"
> +	help
> +	  change file timestamps
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TR
> +	bool "tr"
> +	help
> +	  translate or delete characters
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TRUE
> +	bool "true"
> +	help
> +	  do nothing, successfully
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TRUNCATE
> +	bool "truncate"
> +	help
> +	  shrink or extend the size of a file to the specified size
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TSORT
> +	bool "tsort"
> +	help
> +	  perform topological sort
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_TTY
> +	bool "tty"
> +	help
> +	  print the file name of the terminal connected to standard input
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_UNAME
> +	bool "uname"
> +	help
> +	  print system information
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_UNEXPAND
> +	bool "unexpand"
> +	help
> +	  convert spaces to tabs
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_UNIQ
> +	bool "uniq"
> +	help
> +	  report or omit repeated lines
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_UNLINK
> +	bool "unlink"
> +	help
> +	  call the unlink function to remove the specified file
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_UPTIME
> +	bool "uptime"
> +	help
> +	  tell how long the system has been running
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_USERS
> +	bool "users"
> +	help
> +	  print the user names of users currently logged in to the current host
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_VDIR
> +	bool "vdir"
> +	help
> +	  list directory contents
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_WC
> +	bool "wc"
> +	help
> +	  print newline, word, and byte counts for each file
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_WHO
> +	bool "who"
> +	help
> +	  show who is logged on
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_WHOAMI
> +	bool "whoami"
> +	help
> +	  print effective userid
> +
> +config BR2_PACKAGE_COREUTILS_SELECT_YES
> +	bool "yes"
> +	help
> +	  output a string repeatedly until killed
> +
> +endif

This is really a loooooong list of options that will be annoying to
maintain I believe.

What about instead having a string option to list the requested
binaries? If empty, then the default programs are built and installed.
If non-empty, then only the programs listed in the string option will
be built and installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
