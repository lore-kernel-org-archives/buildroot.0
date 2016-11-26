From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 26 Nov 2016 16:11:01 +0100
Subject: [Buildroot] [PATCH] package/pseudo: update version
In-Reply-To: <20161126150251.4373c78a@free-electrons.com>
References: <20161125212248.3540-1-gael.portay@savoirfairelinux.com>
 <d0e8798c-0d61-663c-5293-99f64806e3a7@mind.be>
 <20161126150251.4373c78a@free-electrons.com>
Message-ID: <c8dd2813-51fa-a6cc-dd07-bcb43a7a77da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-11-16 15:02, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 26 Nov 2016 11:50:45 +0100, Arnout Vandecappelle wrote:
> 
>>>  package/pseudo/pseudo-wrapper | 2 +-
>>>  package/pseudo/pseudo.mk      | 2 +-  
>>
>>  Did you test this? You didn't update the hash file...
> 
> Hash files are not checked for git downloads, so it can work without
> updating the hash. Since the git download helper was fixed to generate
> reproducible archives, we haven't (yet) enabled hash checking for
> git downloads.

 Ah, I never noticed that...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
