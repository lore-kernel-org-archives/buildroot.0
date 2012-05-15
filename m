From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 15 May 2012 14:42:04 +0100
Subject: [Buildroot] [PATCH] jquery-ui: new package
In-Reply-To: <87wr4dvn7g.fsf@macbook.be.48ers.dk>
References: <1337071203-5841-1-git-send-email-spdawson@gmail.com>
 <87wr4dvn7g.fsf@macbook.be.48ers.dk>
Message-ID: <CAHt8ZCPmMf-3ki6F70W3gJVFrku2Z4F2e=9ysVoJrEg73VGbGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've looked at adding it myself, but the problem is the theming. How do
> you expect to handle this?

Hmm. Good question; they don't make it easy with the whole "download
builder" thing. Any suggestions?

On 15 May 2012 09:54, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "spdawson" == spdawson ?<spdawson@gmail.com> writes:
>
> ?spdawson> From: Simon Dawson <spdawson@gmail.com>
> ?spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
>
> ?spdawson> +JQUERY_UI_VERSION = 1.8.20
> ?spdawson> +JQUERY_UI_SITE = http://jqueryui.com/download
> ?spdawson> +JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).custom.zip
> ?spdawson> +
> ?spdawson> +JQUERY_UI_THEME = smoothness
>
> I've looked at adding it myself, but the problem is the theming. How do
> you expect to handle this?
>
> --
> Bye, Peter Korsgaard



-- 
http://www.google.com/profiles/spdawson

Please avoid sending me Word, Excel or PowerPoint attachments.
See http://www.gnu.org/philosophy/no-word-attachments.html
