From: Robert Urban <urban@unix-beratung.de>
Date: Thu, 12 Mar 2009 23:01:48 +0100
Subject: [Buildroot] patch for syntax error in stunnel-4.16 (r25601)
Message-ID: <49B9864C.4010904@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

*** configure   2009-03-12 22:56:40.000000000 +0100
--- configure.patched   2009-03-12 22:57:27.000000000 +0100
***************
*** 24093,24099 ****
  sed 's/^/| /' conftest.$ac_ext >&5

        { $as_echo "$as_me:$LINENO: result: no" >&5
! $as_echo "no" >&6; }, LIBS="$saved_LIBS"

  fi

--- 24093,24099 ----
  sed 's/^/| /' conftest.$ac_ext >&5

        { $as_echo "$as_me:$LINENO: result: no" >&5
! $as_echo "no" >&6; }; LIBS="$saved_LIBS"

  fi
