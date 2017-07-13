From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Jul 2017 11:11:48 +0200
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
In-Reply-To: <69cf264e-bb78-3823-e165-5a3378806741@microchip.com>
References: <1499796056-841-1-git-send-email-joshua.henderson@microchip.com>
 <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
 <69cf264e-bb78-3823-e165-5a3378806741@microchip.com>
Message-ID: <f0fba494-7cad-8022-b5db-6417ec32b0ba@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-07-17 17:55, Joshua Henderson wrote:
> Arnout,
> 
> On 07/11/2017 05:45 PM, Arnout Vandecappelle wrote:
[snip]
>>  You should keep the original author of this patch, as well as their
>> Signed-off-by statements. You lost that now, but you can set it back with "git
>> --amend --author='Brent Sink <brents_3@hotmail.com>'"
> I am the original author of this patch since 5.9.0-beta, with contributions from
> Julien and also some preliminary changes based on Julien's feedback.  

 Sorry, it seems I missed that. I saw a first version by Naoki which was taken
over by Brent, so I assume you had taken over from Brent.


> Whatever needs
> to happen I'm fine with it, and I do realize I'm causing some mess by posting this
> late.  Is the general rule that if somebody else hits the mailing list first they
> should be the "author" of a similar patch?  How does this work?

 No, if you did not base it on Naoki's and Brent's versions, then you're the
original author. In that case, just put Naoki and Brent in Cc of the patch.

 You can find the old versions back in patchwork:

http://patchwork.ozlabs.org/project/buildroot/list/?state=*&q=qt5

which yields:

http://patchwork.ozlabs.org/patch/781475/
http://patchwork.ozlabs.org/patch/783150/
http://patchwork.ozlabs.org/patch/785366/
http://patchwork.ozlabs.org/patch/786786/ (yours)


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
