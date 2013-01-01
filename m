From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jan 2013 15:56:27 +0100
Subject: [Buildroot] [PATCH] efl/libecore: fix build with gcrypt
In-Reply-To: <87wqvxrmvk.fsf@dell.be.48ers.dk>
References: <1357046638-2195-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87wqvxrmvk.fsf@dell.be.48ers.dk>
Message-ID: <20130101155627.1a7c536d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 01 Jan 2013 15:36:31 +0100, Peter Korsgaard wrote:

> No, we shouldn't pull in dependencies behind the users' back. I've
> changed it to only activate when both gnutls and libgcrypt are present.
> 
> Committed with that change, thanks.

Ack, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
