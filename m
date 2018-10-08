From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Oct 2018 10:33:47 +0200
Subject: [Buildroot] [PATCH 1/1] cups-filters: add autoreconf
In-Reply-To: <20181006200245.8380-1-olivier.schonken@gmail.com> (Olivier
 Schonken's message of "Sat, 6 Oct 2018 22:02:45 +0200")
References: <20181006200245.8380-1-olivier.schonken@gmail.com>
Message-ID: <8736tgq1lg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olivier" == Olivier Schonken <olivier.schonken@gmail.com> writes:

 > Because we are patching Makefile.am, Makefile.am is newer than Makefile.in
 > Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 > ---
 >  This fix is for the 2018.08.x and 2018.05.x branches

2018.05.x is now EOL, but our LTS version is also affected.

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
