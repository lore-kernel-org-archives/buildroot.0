From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 21:34:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add option to enable
 sandboxing support
In-Reply-To: <20191215204816.GD218613@momiji> (Adrian Perez de Castro's
 message of "Sun, 15 Dec 2019 20:48:16 +0200")
References: <20191214142216.2609541-1-aperez@igalia.com>
 <20191214212150.6c81132b@windsurf.home>
 <20191215204816.GD218613@momiji>
Message-ID: <8736dle39q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 >> Didn't you forgot a:
 >> 
 >> select BR2_PACKAGE_LIBSECCOMP
 >> 
 >> here ? No need to resend just for that, can be fixed when applying.

 > Good catch, this ?select? is indeed missing. Please add it when applying.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
