From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jan 2012 23:24:20 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2012.02/ext-toolchain-updates
In-Reply-To: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772176.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201201312324.20779.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 28 January 2012 18:36:40 Thomas Petazzoni wrote:
> Changes since the v1 posted on January 4th 2012:
> 
>  - Add comments mentionning that Atom processors are only supported
>    since gcc 4.5 (Peter Korsgaard comment)
> 
>  - Re-add $(Q) where appropriate (Thomas De Schampheleire comment)
> 
>  - Replaced CodeSourcery by Mentor Graphics where appropriate (Thomas
>    De Schampheleire comment)
> 
>  - Add support for the Linaro 2012.01 toolchain
> 

 Thomas,

 Didn't you promise to include my "Automatically set -m64 if the 
architecture is x86_64" patch?  Would you like a repost?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
