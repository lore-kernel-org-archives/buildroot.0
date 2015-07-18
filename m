From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Jul 2015 18:13:06 +0200
Subject: [Buildroot] [PATCH 1/1] angularjs: new package.
In-Reply-To: <CANxTyt67F3+eioQJytWXDwPvEp+TybV_PZGhn4rVxWS2_=4=fg@mail.gmail.com>
References: <1437129876-5158-1-git-send-email-ignacy.gawedzki@green-communications.fr>
 <CAGduivxBdvS75bNaHo_AmWaZZZ4x0qqbr27kVPbLrvjay05uJQ@mail.gmail.com>
 <CANxTyt67F3+eioQJytWXDwPvEp+TybV_PZGhn4rVxWS2_=4=fg@mail.gmail.com>
Message-ID: <CAGduivx4y0Jzg_=g9XPWeFkqtpW2eSYdtYRaw8eYG2oQMMGnDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 18, 2015 at 6:08 PM, Danomi Manchego
<danomimanchego123@gmail.com> wrote:
> On Sat, Jul 18, 2015 at 11:58 AM, Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> wrote:
> ...
>>> +menuconfig BR2_ANGULARJS_MODULES
>>> +       bool "Select AngularJS modules"
>>> +
>>> +       help
>>> +         Select which modules to install, instead of installing all of them.
>> The phrasing seems a bit wrong to me here, but I'm no english expert.
>> Maybe stop at "Select modules to install." ?
>
> If the choice is to select modules to install vs installing *all* of
> them, as opposed to installing *none* of them, then indicating so is
> probably important.  Otherwise, you might be left with the impression
> that no modules are installed by default if this option is not
> selected.
That's why I told Ignacy that the 'default y' as to go. We never
select by default modules of a package, the user has to select them,
otherwise nothing gets installed.
>
> I don't have a problem with the original wording, but maybe could be:
> "All modules are installed by default.  Select 'y' to customize which
> modules to install."
>
> Danomi -
