From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jun 2018 23:29:01 +0200
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <20180605165039.GA29058@scaer>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
 <935950713.1169230.1528197779003.JavaMail.zimbra@datacom.com.br>
 <20180605161546.GE2503@scaer>
 <CALURroS4t3V6GWnZSs6GEcAFrf1=KvfU036dskH6aEM4fQXn8w@mail.gmail.com>
 <20180605165039.GA29058@scaer>
Message-ID: <69845f53-8c5f-910a-58b2-57bf5c0e38e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-06-18 18:50, Yann E. MORIN wrote:
> Christopher, All,
> 
> On 2018-06-05 09:35 -0700, Christopher McCrory spake thusly:
>> Sorry for top post, on mobile.
>> What about using openssl?
>> [1]https://www.openssl.org/docs/manmaster/man1/openssl-passwd.html
> 
> Since we do not require that openssl be installed on the build machine,
> we'd have to build our own one. We do have a host-openssl package, but
> it takes quite a bit of time to build: on my relativelty fast laptop,
> it adds about 32s to the build time. This is a pretty big hit...
> 
> So, not an option IMHO...

 So, not whois, not busybox, not openssl... What about python, which we anyway
require to be installed on the host? I remember that someone has posted a
one-liner that would do the job :-P

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
