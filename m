From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 12:10:17 +0200
Subject: [Buildroot] [PATCH 2/3] whois: use github repo as home page
In-Reply-To: <20170815041434.tlygmw6w4skyih6k@sapphire.tkos.co.il>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <fa924d0754ef385b1706721751e5f6f00e60c199.1502649259.git.baruch@tkos.co.il>
 <20170814220354.3665d3eb@windsurf>
 <20170815041434.tlygmw6w4skyih6k@sapphire.tkos.co.il>
Message-ID: <b6dfe8f7-5fa2-1ade-2aa5-eaeab13b271c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 06:14, Baruch Siach wrote:
> Hi Thomas,
> 
> On Mon, Aug 14, 2017 at 10:03:54PM +0200, Thomas Petazzoni wrote:
>> On Sun, 13 Aug 2017 21:34:18 +0300, Baruch Siach wrote:
>>> The github repo is more informative than the list Marco's software on
>>> the previous link.
>>>
>>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> What about switching the upstream to be Github, instead of fetching
>> from Debian? The Github repo has all the releases available:
>> https://github.com/rfc1036/whois/releases.
>>
>> Just make sure that the 5.2.14 tarball we were getting from Debian is
>> similar in contents to what we get from the Github repository for the
>> same version.
> But we generally prefer upstream provided tarballs, aren't we? Moreover, in 
> this case the Debian repo provides a smaller .tar.xz, and an upstream computed 
> SHA256 in the .dsc file. You don't get that from github.

 On Sunday, I was going to ask the same question, and came to the same
conclusion about the tar.xz and the sha256. Unfortunately, I don't remember why
I didn't just apply it then and there...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
