From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Aug 2017 21:22:37 +0200
Subject: [Buildroot] [PATCH v5 07/14] skeleton-common: rename
 SKELETON_ROOT_PASSWORD to SKELETON_CUSTOM_ROOT_PASSWORD
In-Reply-To: <20170802192917.19f2e623@windsurf.home>
References: <20170801225224.16899-1-arnout@mind.be>
 <20170801225224.16899-8-arnout@mind.be>
 <20170802192917.19f2e623@windsurf.home>
Message-ID: <ac4d3828-f301-81a3-6ed7-b0cefb68c23d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-08-17 19:29, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 2 Aug 2017 00:52:17 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> Package variables should always be prefixed with the package name. For
>> SKELETON_CUSTOM_ROOT_PASSWORD, this means we set the variable a second
> 
> The variable is now named SKELETON_COMMON_ROOT_PASSWORD, not
> SKELETON_CUSTOM_ROOT_PASSWORD. I've fixed that in both the commit title
> and in the above sentence.

 Yeah, I sent it at 00:52, so you can imagine...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
