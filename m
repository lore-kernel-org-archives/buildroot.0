From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2013 21:20:25 +0100
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131124202025.GB3575@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On 2013-09-14 21:03 +0200, Thomas Petazzoni spake thusly:
> Here is the second version of the BR2_EXTERNAL patch series.

I was wondering what the plan with BR2_EXTERNAL was, in the end?

From my recollection of the last DevDay, I understood we would go with
it, with a few changes:
  - add a generated, sub-makefile in $(O) with the definition of
    BR2_EXTERNAL, so that it is not needed to repeat it on the command
    line of future invocations of 'make'
  - enforce the same directory layout, package/ board/ and configs/

Right?

If so, Thomas, since your the original submitter: do you have pending
changes to that effect, or are you waiting for someone to kick in and
continue the work on this patch series?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
