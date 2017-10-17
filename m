From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 Oct 2017 15:14:43 -0500
Subject: [Buildroot] [PATCH] uboot-tools: bugfix libfdt python build
In-Reply-To: <CAOMZO5D3_bxYM9EGVyjAU8QWWtoxcJMQ8VHFUsJFRor9nfG78A@mail.gmail.com>
References: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
 <20171013161128.37827061@windsurf.lan>
 <CANQCQpZhRskjjpSbOiUEEM0qEimpkC+R7NA1B1iV-G+HO1+=iQ@mail.gmail.com>
 <CANQCQpbf+LPbfEnw91CkD7H5kxRSywZGbPD9vcU074e3sA2puA@mail.gmail.com>
 <CAOMZO5BT1YLM2p3GVe7W4SwDYW18fGXCiMKd3D59hYJf9hE7wQ@mail.gmail.com>
 <CANQCQpZFwWLqMZ1Y6mCWQieVFgka+uZs_vJeS6+BPOLUhyPF0A@mail.gmail.com>
 <20171017205437.4689e5f0@windsurf.lan>
 <CANQCQpadPofC9KTcrdiXK0bm6nwph7OcfzYAUXwV673ew9-mzA@mail.gmail.com>
 <CAOMZO5D3_bxYM9EGVyjAU8QWWtoxcJMQ8VHFUsJFRor9nfG78A@mail.gmail.com>
Message-ID: <CANQCQpZ3qMwcq5jFuS=VQp0Xi8w0cbcnamr=ckPuyxdT-Fpivg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Oct 17, 2017 at 2:03 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Matthew,
>
> On Tue, Oct 17, 2017 at 5:00 PM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>
>> Yep, I'll get a patch together for swig/python workaround that doesn't
>> require 2017.9 to fix the autobuilder.  Fabio, assuming we'll skip
>> 2017.9 bump and just go 2017.11?
>
> Sounds good for me.

Superseded by https://patchwork.ozlabs.org/patch/827287/
