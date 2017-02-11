From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2017 16:25:22 +0100
Subject: [Buildroot] rsyslog plugin selection
In-Reply-To: <87poiroepw.fsf@dell.be.48ers.dk>
References: <CAAXf6LUgTQBZK7HnzKd6q64XnAA7nX_n7X3LDdRZfEvKtfeq7w@mail.gmail.com>
 <8737fopew4.fsf@dell.be.48ers.dk>
 <CAAXf6LU7juM840CBNO7=wus8H_OUuByzNW7jwKZ36GX4dp9c9Q@mail.gmail.com>
 <87poiroepw.fsf@dell.be.48ers.dk>
Message-ID: <f46fef40-2d91-be56-91cd-dab85d199b77@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-02-17 11:12, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
> 
> Hi,
> 
>  > I should have mentioned it in my original mail, but the amount of
>  > plugins is about 50:
>  > http://www.rsyslog.com/plugins/
> 
> FYI, not all of them sounds useful (E.G. solaris) or we don't have the
> needed dependencies in BR (relp, hdfs, ..)
> 
> Do we have the n
>  > Nevertheless, I do think that using separate options is indeed the
>  > best approach. To limit the visual impact in the config editor, I
>  > would group them in a submenu instead of flat in the main menu.
> 
>  > Do you agree?
> 
> Yes, I agree. It is quite a lot of options, but not really worse than
> the gst1-plugins-* stuff.
> 

 Maybe a middle ground is to add options for the most common/useful plugins, and
a string for additional plugins. We have that for a few packages already.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
