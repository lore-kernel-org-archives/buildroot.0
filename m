From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Feb 2018 22:13:22 -0600
Subject: [Buildroot] [NEXT 04/26] cpe-info: only report target pkgs
In-Reply-To: <20180227224555.2d44721c@windsurf.lan>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-5-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227224555.2d44721c@windsurf.lan>
Message-ID: <CANQCQpbZgU4tXv1-fUNW5Xr5jozDxSvJJq-apJMVzUJcD=m1+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 27, 2018 at 3:45 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 26 Feb 2018 20:10:19 -0600, Matt Weber wrote:
>
>> +ifneq ($$($(2)_TYPE),host)
>
> Why not:
>
> ifeq ($$($(2)_TYPE),target)
>

Will include in v2  :)

Matt
