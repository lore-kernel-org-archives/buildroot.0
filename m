From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 20:58:22 +0100
Subject: [Buildroot] [PATCH] json-c: Add json_object_iterator.h to
 installed headers
In-Reply-To: <1362551468-5510-1-git-send-email-gilles.talis@gmail.com>
References: <y>
	<1362551468-5510-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20130306205822.4f03863e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles Talis,

On Tue,  5 Mar 2013 22:31:08 -0800, Gilles Talis wrote:
> json_object_iterator.h is not installed in staging directory.
> This leads to an error during pulseaudio build process:
> 
> fatal error: json_object_iterator.h: No such file or directory
> 
> Fixes autobuild failures like:
> http://autobuild.buildroot.org/results/079f9265cd768f88ad57f6f7b794641c845f3079
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
