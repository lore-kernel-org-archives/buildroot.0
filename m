From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Jan 2015 07:57:24 -0600
Subject: [Buildroot] [PATCH v2 4/4] dtc: add patches for raspberry pi
 overlay support
In-Reply-To: <1421000166-24963-4-git-send-email-ps.report@gmx.net>
References: <1421000166-24963-1-git-send-email-ps.report@gmx.net>
 <1421000166-24963-4-git-send-email-ps.report@gmx.net>
Message-ID: <CANQCQpaCnaOxWDo4d+PbjFGxUWeUKdWs11piPfn1+UQZ_Lxgww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, Jan 11, 2015 at 12:16 PM, Peter Seiderer <ps.report@gmx.net> wrote:
> See [1] for documentation of raspberry pi kernel dt overlay support.

Do you happen to know if this overlay support is identical to the
approach used in the beaglebone dts overlays?  (I'm guessing so)
Currently the beaglebone support in Buildroot lacks overlay support.
So if the capability is similar, I'll work on an update to the
beaglebone package to use the dtc package instead of the linux kernel
dtc (I think the kernel dtc install may need a new check to see if the
dtc is enabled to prevent it from installing the kernel dtc).

<snip>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
www.rockwellcollins.com
