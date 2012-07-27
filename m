From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 27 Jul 2012 09:42:40 +0100
Subject: [Buildroot] [PATCH] sconeserver: new package
In-Reply-To: <50117709.8060209@mind.be>
References: <1343051342-12829-1-git-send-email-spdawson@gmail.com>
 <50117709.8060209@mind.be>
Message-ID: <CAHt8ZCMbT-WsfozU4F+0uy9uzi6NzRdPH6Y4Dhs0it1JB7WqNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 July 2012 17:57, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Why doesn't pkg-config find this path?  Are they missing a check for
> libxml-2.0 maybe?

Sorry to backtrack the thread a little, but I just want to reply to
this question before it gets forgotten. Yes, the package configure
script does check for libxml2; but the check doesn't appear to be
doing quite the right thing. I haven't yet got to the bottom of what's
wrong here.

Simon.
