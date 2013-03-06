From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Mar 2013 21:09:58 +0100
Subject: [Buildroot] [PATCH] json-c: Add json_object_iterator.h to
	installed headers
In-Reply-To: <1362551468-5510-1-git-send-email-gilles.talis@gmail.com> (Gilles
 Talis's message of "Tue, 5 Mar 2013 22:31:08 -0800")
References: <1362551468-5510-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87y5e070ix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> json_object_iterator.h is not installed in staging directory.
 Gilles> This leads to an error during pulseaudio build process:

 Gilles> fatal error: json_object_iterator.h: No such file or directory

 Gilles> Fixes autobuild failures like:
 Gilles> http://autobuild.buildroot.org/results/079f9265cd768f88ad57f6f7b794641c845f3079

Committed, thanks.

-- 
Bye, Peter Korsgaard
