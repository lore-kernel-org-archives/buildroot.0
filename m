From: Steve Kenton <skenton@ou.edu>
Date: Thu, 19 Feb 2015 16:55:45 -0600
Subject: [Buildroot] How automate source download from a google drive?
In-Reply-To: <CAJpxd06ncFoxwLkeMyAuhPEXKNeH-Dh--Km=cvF0wN4e47xcVw@mail.gmail.com>
References: <54E54294.3030702@ou.edu>
 <CAJpxd06ncFoxwLkeMyAuhPEXKNeH-Dh--Km=cvF0wN4e47xcVw@mail.gmail.com>
Message-ID: <54E669F1.2090304@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/19/2015 04:12 PM, Bryce Schober wrote:
> On Wed, Feb 18, 2015 at 5:55 PM, Steve Kenton <skenton@ou.edu> wrote:
> 
>> This is a bit off the wall. I'm working with a package called tovid
>> which you download from a google drive by clicking on a link on the wiki
>> Darn if I can figure out how to put that into the .mk file to automate it.
>> Look through packages directory and did not see anything obviously like it
>>
>> Any thoughts would be appreciated
>>
> 
> 
> This worked:
> wget --no-check-certificate '
> https://docs.google.com/uc?export=download&id=0B7aAfFRdwkUmeGZTT2pua0d1Z2c'
> -O ~/Downloads/tovid.tar.gz
> 
> Based on this SO answer:
> http://unix.stackexchange.com/a/148674/22389
> 
> You'll need to specify the full download name of the file because the wget
> redirect apparently doesn't get it.
> 
> <><  <><  <><
> Bryce Schober
> 
Wow, thank you very much. Your Google-fu is clearly superior to mine!

Steve
