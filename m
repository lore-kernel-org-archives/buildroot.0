From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 31 Oct 2014 12:06:43 +0100
Subject: [Buildroot] [RFC] Responsive Design Website
In-Reply-To: <782144F7-60DD-4BB5-8EF3-D992743186F6@gmail.com>
References: <CA+TH9VmP76wiQFJgn4i+f6b_oO7uQc2Duoswz+H5vrj=F0AOTA@mail.gmail.com>
 <20141028172031.28dfdde4@free-electrons.com>
 <CA+TH9VnZLSvKJjze-JhCrZQtdPJhc9eErMT4iAwMw+ZRJFLgUg@mail.gmail.com>
 <CA+TH9VkMsJ8RSoBfz+imu8vq8nhZyQck3G7f-FUjyiG7aYh1-A@mail.gmail.com>
 <20141031101932.6dc2069c@free-electrons.com>
 <782144F7-60DD-4BB5-8EF3-D992743186F6@gmail.com>
Message-ID: <CA+TH9V=o_erPS2D0z-0QXq_egtXiHwq0W+ZLfvsqq7G7H0WXnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list!

@ Thomas Petazoni
> Looks great! There's one issue left I believe: on the sponsors page,
> when you reduce the width of the browser window, then the width of each
> gray block for each sponsor is different. See the screen shot at
> http://imgur.com/hw3MaRc.

Fixed. I'm reworking the patch and plitting in approriate subpatches,
they will be ready in weekend I think.

@ Thomas De Schampheleire
> Another thing I noticed is that there's a
> considerable delay (about half a second)
> between tapping the menu button and
> the menu starting sliding down. I see this
> on my phone. Is this a configurable option
> or just processing?

Cannot reproduce the problem on my really old htc g2. For me the menu
sliding is more or less instantaneous.
By the way, I used the defaults provided by bootstrap, I'll try to look at that.

Sincerely, Angelo

2014-10-31 11:43 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
> On October 31, 2014 10:19:32 AM CET, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>>Dear Angelo Compagnucci,
>>
>>On Fri, 31 Oct 2014 10:06:48 +0100, Angelo Compagnucci wrote:
>>> Hello List,
>>>
>>> Another slightly update (minor fixings), now it should be ready for
>>production!
>>>
>>> Hope you like it!
>>>
>>> http://buildrootrd.idea-on-line.it/
>>
>>Looks great! There's one issue left I believe: on the sponsors page,
>>when you reduce the width of the browser window, then the width of each
>>gray block for each sponsor is different. See the screen shot at
>>http://imgur.com/hw3MaRc.
>
> Another thing I noticed is that there's a
>  considerable delay (about half a second)
>  between tapping the menu button and
>  the menu starting sliding down. I see this
>  on my phone. Is this a configurable option
>  or just processing?
>
> Thanks,
> Thomas
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
