From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 14:34:00 +0100
Subject: [Buildroot] [RFC 00/11] common init infrastructure
In-Reply-To: <20150322132358.GC21403@vostro>
References: <cover.1426960081.git.alex.suykov@gmail.com>
 <20150322112807.GA4724@free.fr> <20150322132358.GC21403@vostro>
Message-ID: <550EC4C8.6020605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/15 14:23, Alex Suykov wrote:
> Sun, Mar 22, 2015 at 12:28:07PM +0100, Yann E. MORIN wrote:
[snip]
>> Otherwise, I have a feeling this is pushing things a bit too far. I'm
>> usually very happy with "abstraction" and I more than once have pushed
>> for such changes. However, in this area, I'm a bit sceptic as to whether
>> we should introduce our own "initscript" format (the '.run' files).
> That's a valid point, but I think buildroot already uses its own
> initscript format, namely its sysv(-style) initscripts.
> 
> They are supplied with buildroot, they are non-standard, and they are
> nearly useless outside of buildroot.
> 
> So I see it a choice between different formats for buildroot-specific
> service description, and the one currently in use does not look like
> a good data storage format at all.

 The point is that the shell scripts provided by buildroot are just shell, so
"anyone" can understand and modify them. While the .run format is something new
that nobody knows, and even if it is documented it will be non-trivial to find
the documentation.

 That's also why I say that the .run format should be verbose, to make it easy
to read and modify.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
