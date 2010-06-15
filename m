From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jun 2010 10:59:06 +0200
Subject: [Buildroot] PATCH [1/1] fix  building QT with uclibc 0.9.31
In-Reply-To: <4E257B4130C8484E8CF9FF02387EAF61@apexjs> (Sagaert Johan's
	message of "Mon, 14 Jun 2010 12:10:15 +0200")
References: <4E257B4130C8484E8CF9FF02387EAF61@apexjs>
Message-ID: <87hbl4eko5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi Peter

 Sagaert> Did you build the JavaScriptCore and Multimedia module ?

Ahh, no - I didn't. I've tested it now and see the issue as well.

 Sagaert> I had a build error : pthread_getattr_np is not defined in uclibc,
 Sagaert> there was a workaround for uclibc 0.9.30.x but not for 0.9.31.

Where does this patch come from? We try to add a description of what the
patches do and where they come from to the top of the files.

-- 
Bye, Peter Korsgaard
