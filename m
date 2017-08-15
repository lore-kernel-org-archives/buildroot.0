From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 17:23:00 +0200
Subject: [Buildroot] [PATCH 2/3] whois: use github repo as home page
In-Reply-To: <20170815140739.3370030e@windsurf>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <fa924d0754ef385b1706721751e5f6f00e60c199.1502649259.git.baruch@tkos.co.il>
 <20170814220354.3665d3eb@windsurf>
 <20170815041434.tlygmw6w4skyih6k@sapphire.tkos.co.il>
 <b6dfe8f7-5fa2-1ade-2aa5-eaeab13b271c@mind.be>
 <20170815125621.4d78c480@windsurf>
 <20170815112018.rg7udjb7zlfps4ue@sapphire.tkos.co.il>
 <20170815140739.3370030e@windsurf>
Message-ID: <913da711-54bf-e3b9-04ac-c54d0d650a8d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 14:07, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 15 Aug 2017 14:20:18 +0300, Baruch Siach wrote:
> 
>> On Tue, Aug 15, 2017 at 12:56:21PM +0200, Thomas Petazzoni wrote:
[snip]
>> The real whois upstream README file says this:
>>
>>   The canonical distribution point for releases of the program is
>>   http://ftp.debian.org/debian/pool/main/w/whois/ .
> 
> Fair enough. But I still find it completely weird to have the Github
> page as the "project home page" indicated in the Config.in file, and
> not use that as the upstream.

 It's weird, but it is what it is. Don't we have any other package where the
github repo is the upstream URL, but the release tarball comes from somewhere else?


> And Arnout has put PATCH 1/3 back to the New state, while I still
> disagree with the approach being taken.

 Sorry, I hadn't seen your reply to 1/3, I had also seen your reply to 2/3 and
considered that Baruch and I had given sufficient feedback to warrant going back
to New. With your reply to 1/3, it indeed makes sense to set the entire series
to Changes Requested.

 However, I'm just going to apply patch 3/3 now, since there is no objection to
that one. So only 1/3 and 2/3 will be Changes Requested.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
