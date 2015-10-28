From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 28 Oct 2015 17:34:45 -0400
Subject: [Buildroot] [PATCH v5 1/1] yad: new package
In-Reply-To: <562F8D35.3000602@imgtec.com>
References: <1445641812-7704-1-git-send-email-james.knight@rockwellcollins.com>
 <562F8D35.3000602@imgtec.com>
Message-ID: <CALe+oY-dFj4aCxv3Nes5N7uH0B5LbcEFuKnMDd4No_YNT4nFdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent,

First off, thanks for reviewing/testing (as always).

On Tue, Oct 27, 2015 at 10:41 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
>> +     help
>> +       YAD (yet another dialog) is a tool for create graphical dialogs from
>
> That line exceeds the 72 characters limit considering 8-characters-wide
> tabs.

Sorry, I'm confused. I only moved the word "from" into the lined based
off your previous suggestion:

On Wed, Oct 7, 2015 at 6:08 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
>> +     select BR2_PACKAGE_LIBGLIB2
>> +     help
>> +       YAD (yet another dialog) is a tool for create graphical dialogs
>> +       from shell scripts.
>
> The word "from" still fits in the first line as it will not exceed the
> 72 characters limit.

Am I missing something?
