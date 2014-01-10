From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Jan 2014 07:44:53 +0100
Subject: [Buildroot] [PATCH 3 of 5 v3] manual package list: add symbol
 name in table
In-Reply-To: <aede5cd8614f3dd67a21.1388764972@argentina>
References: <patchbomb.1388764969@argentina>
 <aede5cd8614f3dd67a21.1388764972@argentina>
Message-ID: <52CF96E5.50305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/14 17:02, Thomas De Schampheleire wrote:
> Particularly in the list of deprecated packages, it is not always clear what
> the entry name refers to. For example, for squashfs3 rootfs support, the
> string is simply "3.x". Likewise for the flex target binary: "Install tool
> in the target".
>
> To clarify the entries, add the actual symbol name (BR2_xxx) in the table.
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

  I checked the PDF output, and the column with the symbol names 
overflows into the following column, rendering the whole thing unreadable.

  Since it's only the two entries that you mention that are confusing, 
and since the squashfs3 part will be removed in the next patch, I'd 
dispense of this completely and instead change the wording of the flex 
symbol.

  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
