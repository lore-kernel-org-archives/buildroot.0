From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 May 2019 21:17:36 +0200
Subject: [Buildroot] [PATCH v4] package/radvd: improve startup script
In-Reply-To: <20190502020152.32632-1-unixmania@gmail.com>
 (unixmania@gmail.com's message of "Wed, 1 May 2019 23:01:52 -0300")
References: <20190502020152.32632-1-unixmania@gmail.com>
Message-ID: <87y33kaey7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > - Add start, stop and restart/reload options, following the logic used
 >   in other init scripts (e.g. S01syslogd).

 > - Do nothing if /etc/radvd.conf does not exist instead of printing an
 >   error message. It is valid to install radvd without a configuration
 >   file. The daemon may be started later by another service with a
 >   configuration created at run-time.

 > - Print an error message if the kernel does not support IPv6 forwarding,
 >   which is required by radvd.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > ---
 > Changes v3->v4
 > - Changed SOB, since I don't work for DATACOM anymore.
 > - Use the same template of other init scripts.

Committed, thanks.

-- 
Bye, Peter Korsgaard
