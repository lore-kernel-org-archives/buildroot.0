From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 02 Jul 2017 21:48:28 -0300
Subject: [Buildroot] [RFC PATCH v2] pkg-stats: allow to sort by column
References: <740effdf-e2a8-c5da-9593-1891f20d29f7@mind.be>
Message-ID: <5959945cb8cae_285b3f8c0c9362b41405e@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Jul 01, 2017 at 05:01 AM, Arnout Vandecappelle wrote:

>  However, I wonder: why not just use the upstream URL in the script tag? Or is
> that too much of a security risk?

I don't have much experience writing html/JavaScript code, so I just followed
the instructions in the author's website.
https://www.kryogenix.org/code/browser/sorttable/
"
1. Download the Javascript library
2. Include the Javascript library, by putting a link to it in the HEAD of your
page, like so:
<script src="sorttable.js"></script>
"
But I could contact the author if using the upstream URL is desirable.

>> +#  wget -O - https://www.kryogenix.org/code/browser/sorttable/sorttable.js \
>> +#    > /tmp/sorttable.js
> 
>  Small nit: -O specifies the output file, so the redirect bit silly.
> 
> wget https://www.kryogenix.org/code/browser/sorttable/sorttable.js \
>   -O /tmp/sorttable.js

Thank you for catching this, I will fix it.

>>  <a href=\"#results\">Results</a><br/>
>>  
> 
>  It would be nice to add some text here to say that you can click on the title
> to sort it, since it's not that obvious.

Good idea. I will do that.

Regards,
Ricardo
