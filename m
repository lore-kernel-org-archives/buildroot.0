From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 8 Aug 2018 06:38:34 -0500
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <9a76db59-2d32-4227-bc93-be06b3fc9866@cesnet.cz>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <425833b3-d86f-4275-bc3c-a80c6385b030@cesnet.cz>
 <9a76db59-2d32-4227-bc93-be06b3fc9866@cesnet.cz>
Message-ID: <CANQCQpaiCVcaVZ85RYY+DPuU59MCcSa5choC7arzSki=H0bpeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan,

On Wed, Aug 8, 2018 at 3:36 AM Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:
>
> I just got a similar failure from an in-tree package, the spi-tools:

Cool, would you mind sharing your buildroot master hash + which of the
patchwork patches you've applied to it?  I'll recreate and take a
look.

Matt
