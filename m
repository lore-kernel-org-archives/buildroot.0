From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:32:44 +0200
Subject: [Buildroot] [PATCH v2] gnupg: Add options for SHA-256 and
 SHA-512 hashes
In-Reply-To: <20170407010943.80192-1-jack@kumunetworks.com>
References: <20170406010908.95234-1-jack@kumunetworks.com>
 <20170407010943.80192-1-jack@kumunetworks.com>
Message-ID: <20170408153244.0ba4805e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Apr 2017 18:09:43 -0700, Jack Breese wrote:
> Signed-off-by: Jack Breese <jack@kumunetworks.com>
> 
> ---
> Changes v1 -> v2:
>  - Enable SHA-256 and SHA-512 unconditionally because
>    size difference is small. (~6k on armv7l) (Suggested by Baruch)

I've applied, but after fixing the commit title: you're no longer
adding options for SHA256 and SHA512, but enabling those
unconditionally.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
