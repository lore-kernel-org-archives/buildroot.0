From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 15 Oct 2017 10:09:53 -0200
Subject: [Buildroot] [PATCH] uboot-tools: bugfix libfdt python build
In-Reply-To: <CANQCQpbf+LPbfEnw91CkD7H5kxRSywZGbPD9vcU074e3sA2puA@mail.gmail.com>
References: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
 <20171013161128.37827061@windsurf.lan>
 <CANQCQpZhRskjjpSbOiUEEM0qEimpkC+R7NA1B1iV-G+HO1+=iQ@mail.gmail.com>
 <CANQCQpbf+LPbfEnw91CkD7H5kxRSywZGbPD9vcU074e3sA2puA@mail.gmail.com>
Message-ID: <CAOMZO5BT1YLM2p3GVe7W4SwDYW18fGXCiMKd3D59hYJf9hE7wQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Sat, Oct 14, 2017 at 6:44 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:

> I dug further into the python/swig issue in uboot/uboot-tools and
> their build of libfdt.  I ended up with the following conclusions.
> 1) Need to bump both packages to 2017.9 which I noticed was already
> underway (Thanks Fabio).  This removes part of this patch submission
> that fixed the python interpreter (already upstream after 9/3)

I sent a patch bumping u-boot-tools to 2011.09, but Peter and Arnout
reported build issues with it, so that's why it has not been applied:
http://patchwork.ozlabs.org/patch/812555/

I haven't had a chance to look at this issue, but if you are
interested, feel free to address the problem and submit the bump
patch.

Thanks
