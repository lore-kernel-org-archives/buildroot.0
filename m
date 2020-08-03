From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Aug 2020 23:10:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/gd: fix CVE-2018-14553 and
 CVE-2019-6977
In-Reply-To: <20200731075136.141361-1-fontaine.fabrice@gmail.com>
References: <20200731075136.141361-1-fontaine.fabrice@gmail.com>
Message-ID: <CACXmViYhtNZDSM6Hk1XmXMUG9p-2kT_bRXNJFLQAqbVrjT0Rog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 31, 2020 at 9:51 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> - Fix CVE-2018-14553 : gdImageClone in gd.c in libgd 2.1.0-rc2 through
>   2.2.5 has a NULL pointer dereference allowing attackers to crash an
>   application via a specific function call sequence.
>
> - Fix CVE-2019-6977: gdImageColorMatch in gd_color_match.c in the GD
>   Graphics Library (aka LibGD) 2.2.5, as used in the imagecolormatch
>   function in PHP before 5.6.40, 7.x before 7.1.26, 7.2.x before 7.2.14,
>   and 7.3.x before 7.3.1, has a heap-based buffer overflow. This can be
>   exploited by an attacker who is able to trigger imagecolormatch calls
>   with crafted image data.
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks

-- 
Bye, Peter Korsgaard
