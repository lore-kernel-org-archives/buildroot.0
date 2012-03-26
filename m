From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Mar 2012 09:55:45 +0200
Subject: [Buildroot] [PATCH v3] Add dtc (device tree compiler) as host
	tool
In-Reply-To: <CAAXf6LWfzdb72VKYT_LQuw68n4CL6Cm5pD8NgFuWCradTzcyUg@mail.gmail.com>
References: <0e9c281db61ec6c47a7a.1332513454@beantl019720>
 <CAAAP30GNdXcQP8hMKBNVxDmeHVWqXYfXke41cmNgzCpqzOi6fg@mail.gmail.com>
 <CAAXf6LWfzdb72VKYT_LQuw68n4CL6Cm5pD8NgFuWCradTzcyUg@mail.gmail.com>
Message-ID: <201203260955.45889.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 26 March 2012 09:15:49 Thomas De Schampheleire wrote:
> > Why not move this into the linux.mk package?
> > If the user has selected DTC support, just copy from the built kernel.
> 
> This sounds like a fine proposal to me...
> Does anyone have objections against it?

 Sounds good to me!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120326/bac3832a/attachment.html>
