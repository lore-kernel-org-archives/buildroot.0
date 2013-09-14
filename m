From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 14 Sep 2013 20:39:32 +0100
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHt8ZCPjaxG3=c9Qo1gYCjcCgM8h7r4sV+8x-JtQ0a0DEV7cmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 September 2013 20:03, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Here is the second version of the BR2_EXTERNAL patch series.

This is looking really good, and fits my typical workflow very nicely.

> Remaning questions
> ==================
>
>  * Interaction with the 'local.mk' mechanism. Should 'external.mk'
>    replace the 'local.mk' mechanism? Should they co-exist?

This is my only slight concern. I would personally prefer to see the
local.mk mechanism replaced by the new external.mk mechanism; it just
feels wrong to have both mechanisms in there.

Simon.
