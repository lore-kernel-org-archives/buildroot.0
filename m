From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Oct 2014 15:15:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Add eventfd_read() and
	eventfd_write()
References: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de>
 <87wq7p57i0.fsf@dell.be.48ers.dk>
 <XnsA3D1CF411C49EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <874mur908x.fsf@dell.be.48ers.dk>
Message-ID: <XnsA3D29B362F47CberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> wrote in
news:874mur908x.fsf at dell.be.48ers.dk: 

> Is there any specific reason why you are using uClibc instead of musl or
> glibc? 

Hi,

yes, the fli4l project is based on uclibc, a design choice where I have no 
control over, I am only adding my kodi package to it.

Regards, Bernd
