From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:23:44 +0100
Subject: [Buildroot] [PATCH v2 02/18] pkg-rebar.mk: pass C++ compiler
 path and options
In-Reply-To: <1454443064-14269-3-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-3-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160220192344.65c25650@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue,  2 Feb 2016 14:57:28 -0500, Frank Hunleth wrote:
> Previously only the C compiler path and options were passed to rebar.
> Erlang projects that used the C++ compiler would fail to build. This
> fixes those errors.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/pkg-rebar.mk | 2 ++
>  1 file changed, 2 insertions(+)

I've added the information suggested by Romain Naour in the commit log,
i.e the package that first needed the C++ support. And then I've
applied to the next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
