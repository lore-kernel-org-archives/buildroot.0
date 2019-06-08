From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 18:35:09 +0200
Subject: [Buildroot] [PATCH v4] package/exiv2: cleanup options and
 licenses
In-Reply-To: <20190605134957.27400-1-nicolas.serafini@sensefly.com>
References: <20190605134957.27400-1-nicolas.serafini@sensefly.com>
Message-ID: <62343e6e-f380-1a54-a41d-5c04cdc4332e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/06/2019 15:51, Nicolas Serafini wrote:
> exiv2 no longer requires a non commercial option for lens database
> integration since version 0.27. See [1] and [2]
> 
> The BR2_PACKAGE_EXIV2_LENSDATA option is maintained because the
> src/nikonmn_int.cpp file always specifies that the Nikon lens name
> database is free to use in non-commercial, GPL or open source software
> only.
> 
> Legacy handling for the removed option COMMERCIAL is not needed, since
> now it's always enabled.
> 
> Add the dedicated BSD-3-Clause license file for CMakeLists.txt,
> config/FindEXPAT.cmake and config/FindMSGFMT.cmake files.
> 
> [1] https://github.com/Exiv2/exiv2/commit/07f63003b7f50dd7d8719585ba54623e0f60c3c4
> [2] https://github.com/Exiv2/exiv2/commit/085d8a309aafb8ed5a72cad027a1a0ea974938d9
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

 In the end, I applied to master as is, without the legacy. Peter, if you feel
strongly about it, you can still add the legacy entry later, and we can have
some more discussion about it :-)

 Regards,
 Arnout
