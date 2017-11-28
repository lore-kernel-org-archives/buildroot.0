From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 28 Nov 2017 16:55:48 -0600
Subject: [Buildroot] [V2 1/1] package/strongswan: Install libraries to
 /usr/lib
In-Reply-To: <20171021095108.0ea87545@windsurf>
References: <1504192688-56951-1-git-send-email-sam.voss@rockwellcollins.com>
 <20171021095108.0ea87545@windsurf>
Message-ID: <CAH=K+6khy3cY1KUdJc6X=jYLoDus-1u2Tjk6CyGTenSb_zQGhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sat, Oct 21, 2017 at 2:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> However, I did a test build, and I do see /usr/lib/ipsec kept in the
> RPATH:
>
>  0x0000001d (RUNPATH)                    Library runpath: [/usr/lib/ipsec]

My tests seem to be showing the same. I'm going to have to see if it
is something we injected ourselves causing the issue.

> So, even though installing the libraries in /usr/lib is indeed better
> for consistency, I'd like to understand why you had an issue running
> the Strongswan program.

I can fix the commit message if you'd still like the patch, else I'll
leave it as is until I get some more explanation on why we had this
issue in the first place.

Thanks!

Sam
