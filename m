From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:14:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: security bump to
 version 0.9.5
In-Reply-To: <20200911210306.617737-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 11 Sep 2020 23:03:06 +0200")
References: <20200911210306.617737-1-fontaine.fabrice@gmail.com>
Message-ID: <87imceucuu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patches (already in version)
 > - Fix CVE-2020-16135: libssh 0.9.4 has a NULL pointer dereference in
 >   tftpserver.c if ssh_buffer_new returns NULL.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
