From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 21:38:46 +0200
Subject: [Buildroot] [PATCH v3 3/3] qt5base: make harfbuzz support
	selectable
In-Reply-To: <20170218113202.14213-3-ps.report@gmx.net>
References: <20170218113202.14213-1-ps.report@gmx.net>
 <20170218113202.14213-3-ps.report@gmx.net>
Message-ID: <492b91bf-c4a8-1918-9dc7-ff048955405c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-02-17 12:32, Peter Seiderer wrote:
> If selected use:
> 
>  - system/buildroot harfbuzz in case __sync for 4 bytes is supported
>  - qt harfbuzz otherwise (using QAtomic instead)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>


 *Finally* applied to master, thanks.

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
