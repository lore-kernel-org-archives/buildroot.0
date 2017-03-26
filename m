From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 Mar 2017 12:34:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-24
In-Reply-To: <20170325072834.09F51207FA@mail.free-electrons.com>
References: <20170325072834.09F51207FA@mail.free-electrons.com>
Message-ID: <fbee7b83-68ff-9081-28ef-4f75b1c7cc48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-03-17 08:28, Thomas Petazzoni wrote:
>         or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fa37b4cee01301dc01394fb279e7a16f10e3a6b5 | ORPH

 This looks to me like a compiler bug. It seems that with -fPIC, static class
members are generated with a 16-bit GOT entry. That means that they can only be
used in binaries smaller than 64K...

 Looks like Waldemar asked about this at some point on #openrisc but got no
response.

 What to do with this?

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
