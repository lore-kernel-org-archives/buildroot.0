From: Daniel Price <daniel.price@gmail.com>
Date: Mon, 4 Mar 2013 17:07:33 -0800
Subject: [Buildroot] [PATCH 1/2 V3] Add bzip2 to host-python when it is
 selected (aids in compiling nodejs)
In-Reply-To: <20130304215240.5316cea9@skate>
References: <1362099940-25020-1-git-send-email-daniel.price@gmail.com>
 <20130304215240.5316cea9@skate>
Message-ID: <CAKduhStavvvdKGet=PyWKWOmAzk5WemDj+MmuWAKSMyPPnp0wQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok.  I'm agnostic about how we solve this.  I can incorporate your
patch.  So do I append your "Signed-off-by" to mine?   I don't want to
do it the wrong way.

        -dp

On Mon, Mar 4, 2013 at 12:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Daniel Price,
>
> On Thu, 28 Feb 2013 17:05:40 -0800, Daniel Price wrote:
>> Based off of patches posted by (and Signed-off-by): Jonathan Liu <net147@gmail.com>
>>
>> Signed-off-by: Daniel Price <daniel.price@gmail.com>
>
> If you add the attached patch to the nodejs package, then we no longer
> need the bz2 module in Python, at least not in the default nodejs build.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com



--
Daniel.Price at gmail.com; Twitter: @danielbprice
