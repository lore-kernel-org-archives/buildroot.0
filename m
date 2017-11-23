From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:03:55 +0100
Subject: [Buildroot] [PATCH v3 1/1] refpolicy: bump to 2.20170805
In-Reply-To: <20171107144915.32423-1-Adamduskett@outlook.com>
References: <20171107144915.32423-1-Adamduskett@outlook.com>
Message-ID: <20171123230355.4cd0e986@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Nov 2017 09:49:15 -0500, Adam Duskett wrote:
> In addition to a simple bump, the following extra changes have occured:
>   - Change the refpolicy site to the official release URL.
>   - Remove REFPOLICY_SITE_METHOD and REFPOLICY_GIT_SUBMODULES as the contrib
>     submodule is included in the release tarball.
>   - Refpolicy is now compatible with python3, as such, remove host-python.
>     from the dependencies and add a check for python3 or python in it's place.
>   - Add upstreamed 0001-fix-regex-escape-sequence-error.patch to fix building
>     against python3.6.
>   - Add sha256 license hash to hash file.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - removed REFPOLICY_PYTHON variable from refpolicy.mk (Thomas)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
