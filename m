From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Jan 2020 09:56:38 +0100
Subject: [Buildroot] [PATCH 1/4] core/pkg-infra: introduce download
 features concept
In-Reply-To: <20200117164432.GK22540@scaer>
References: <20200116193852.17683-1-vfazio@xes-inc.com>
 <CAMQcK5+-_N_Rwkx6E+w7eid5rKNVNjith7Feg8yYgzQX+dvtQQ@mail.gmail.com>
 <674b2ca7-cb45-c89d-a5e5-cfc230200db2@xes-inc.com>
 <b782018a-bec1-07d5-da24-128d4eba2a1b@mind.be>
 <20200117091755.69711c60@windsurf> <20200117164432.GK22540@scaer>
Message-ID: <36d96c34-c5d2-26a3-6284-6e5035cc1ab9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/01/2020 17:44, Yann E. MORIN wrote:

[snip]
> At some point in the past, Arnout expressed some concern about adding yet
> more variables,

 That was more about internal variables, not user-facing variables. And also
about variables that are actually assigned to. Each variable that is set in
inner-generic-package gets multiplied a thousandfold and this puts pressure on
the internal tables in make.

> and this feature thingy would be the opportunity to
> coalesce many variables into a single one (or rather, avoiud adding new
> variables).

 Iff there are several users of it. So, as I said, it's a good idea if we get 4
features.


 Regards,
 Arnout
