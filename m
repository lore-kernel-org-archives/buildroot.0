From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 22:21:21 +0100
Subject: [Buildroot] [PATCH v2,1/1] libserial: bump to version 1.0.0
In-Reply-To: <20190114063529.12178-1-fontaine.fabrice@gmail.com>
References: <20190114063529.12178-1-fontaine.fabrice@gmail.com>
Message-ID: <20190114222121.6c01f215@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Jan 2019 07:35:29 +0100, Fabrice Fontaine wrote:
> - Move site to github
> - Add gcc >= 5 dependency for C++14:
>   https://github.com/crayzeewulf/libserial/commit/cafeffaa60f23012675d908b1e13b89aad3b56b2
> - Remove first patch and use --without-python instead
> - Remove second patch (patch has been merged in 2015:
>   https://github.com/crayzeewulf/libserial/commit/47ca0621ccd2100e4ba0d7f4e2a861d14f05f63c)
> - Add a new patch to fix build when size_t is an unsigned int
> - Use new --disable-tests option
> - Update license to BSD-3-Clause and replace COPYING by LICENSE.txt:
>   https://github.com/crayzeewulf/libserial/commit/3f12abc045aae34a40a6fc9a9b5ed0a1bc6b2049
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add gcc >= 5 dependency for C++14

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
