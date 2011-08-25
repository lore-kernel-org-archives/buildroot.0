From: Niall Parker <stuff@pender.dnsalias.net>
Date: Thu, 25 Aug 2011 12:14:14 -0700
Subject: [Buildroot] bash instead of busybox
In-Reply-To: <CALo-6+iKroWCcD1a45F1w2YbPbEv+M-4ioncrsafzrKamGu=rg@mail.gmail.com>
References: <CALo-6+g4dksK0EaCbwsmNu+L53GuveFFJkheggnbePWf-PNHZg@mail.gmail.com>
 <20110825181736.GI4926@sgi.com>
 <CALo-6+iKroWCcD1a45F1w2YbPbEv+M-4ioncrsafzrKamGu=rg@mail.gmail.com>
Message-ID: <4E569F06.1030802@pender.dnsalias.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-08-25 11:32 AM, Charles Krinke wrote:
> Dear Robin:
>
> I considered that, but am caught in one of the old "the customer says
> he doesnt want busybox", so I am trying to find the various packages.
> I have gotten some working and am now at the point where the sysvinit
> package needs getty. I also havent figured out how to get the
> fileutils package into buildroot so I can get things like "ls", but as
> I find packages that seem appropriate to buildroot, I can add them and
> still boot the rootfilesystem albeit with erros of "cannot execute"
> here and there.
>
As you have found, the buildroot rfs is conventionally used with busybox 
for most of the common utilities, you may want to push back on the 
customer requirement of "no busybox" and get clarification on whether 
they truly want it completely purged or just wanted bash for their shell.

             ... Niall
