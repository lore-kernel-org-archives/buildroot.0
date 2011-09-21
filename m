From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 10:16:05 +0200
Subject: [Buildroot] [PATCH 1 of 2] linux: add linux-update target to
	save configuration
In-Reply-To: <20110921092854.7382e60c@skate>
References: <patchbomb.1316587574@localhost6.localdomain6>
 <9c76ca74224570a6b9e8.1316587575@localhost6.localdomain6>
 <20110921092854.7382e60c@skate>
Message-ID: <CAAXf6LW2C41Z8cT2Vv_WPq=psipyiUePaUT8ZgUWsEFjmCgptQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Sep 21, 2011 at 9:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Wed, 21 Sep 2011 08:46:15 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> In analogy to build targets uclibc-update and busybox-update, add linux-update
>> that copies the current configuration to the custom configuration file set in
>> buildroot.
>> This facilitates the work of developers adding support for a specific board
>> to buildroot.
>
> Definitely a good thing to have. However:
>
> ?* The name if misleading. "linux-update" "busybox-update": one is not
> ? "updating" Linux or Busybox, but rather copying or updating the
> ? configuration. So presumably the name of those targets should be
> ? changed.

I agree that the name is a bit strange. "busybox-update" and
"uclibc-update" were introduced back in 2007:
