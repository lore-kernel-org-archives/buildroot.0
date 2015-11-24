From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Nov 2015 09:32:01 +0100
Subject: [Buildroot] docs/website: New website
In-Reply-To: <87oaek2wnr.fsf@dell.be.48ers.dk>
References: <CA+TH9VmNdKfHr5v8-OteT6TLC8DK-HGshyUnbHgX_p+A2rW2=A@mail.gmail.com>
 <87oaek2wnr.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VmKn1HuQ_G41izgvY-5Sc+8NOrACQTra=EUAQs5oj8ZxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

2015-11-23 23:11 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
> Hi,
>
>  > This patch introduces a new buildroot website based on a modern
>  > flat layout inspired by material design.
>  > Each page of the old website is converted to the new css/layout,
>  > the big bump is in main page which is completely rewritten.
>  > Content of the old website is copied more or less verbatim,
>  > planning to add more content in the future.
>
>  > You can find a complete demo site here:
>
>  > http://angeloc.github.io
>
> Committed (From Thomas' branch at
> http://git.free-electrons.com/users/thomas-petazzoni/buildroot/?h=website)
> - Thanks!
>
> It looks very nice. I did notice that my browser blocked one of the
> external ressources it uses:
>
> https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js

This scripts makes possible to copy something into your clipboard from
a website and it is used at the download page for the buttons on the
right of textboxes. It works similarly to github copy to clipboard
button.

> What is this clipboard.js about and any idea why my browser (chrome)
> would block it?

Honestly I don't know, probably you have some sort of javascript
filtering, I personally tested this button on the vanilla chrome and
it works.

Sincerely, Angelo

>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
