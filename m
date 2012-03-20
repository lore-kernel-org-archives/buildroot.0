From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 20 Mar 2012 13:11:24 -0400
Subject: [Buildroot] [PATCH] New package: zxing
In-Reply-To: <1332205009-31559-1-git-send-email-fhunleth@troodon-software.com>
References: <1332205009-31559-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <CA+-urNSybNqOsdCRPHetZDckkx4k1pEwtzETOVXw8ML3s=P1zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 19, 2012 at 8:56 PM, Frank Hunleth
<fhunleth@troodon-software.com> wrote:
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> ?package/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?1 +
> ?package/zxing/Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? 14 +++++++
> ?package/zxing/zxing-2.0-crosscompile-support.patch | ? 30 +++++++++++++++

One quick note on zxing-2.0-crosscompile-support.patch. It modifies an
SConscript file in zxing that has CRLF line endings. I'm not sure if
the line endings got stripped by git send-email or anything
downstream, but if they did, I just noticed that the patch fails to
apply.

-Frank
