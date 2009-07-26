From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 26 Jul 2009 11:38:55 +0200
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <87r5w3syn7.fsf@macbook.be.48ers.dk>
References: <4A689265.6030308@atmel.com>
	<87skgmwm6h.fsf@macbook.be.48ers.dk>	<4A69741A.8010903@atmel.com>	<20090724085603.GL13236@buzzloop.caiaq.de>	<9E543F22BF68405185D6B77291E4E5EF@aeglos>	<20090724121641.2c4cf8bd@surf>
	<4A699CDD.7060703@atmel.com>	<20090724152448.4d1f5934@surf>
	<4A69D04E.9040408@atmel.com>	<20090724224516.15b39e30@surf>
	<4A6BEE7C.4080308@atmel.com> <87r5w3syn7.fsf@macbook.be.48ers.dk>
Message-ID: <4A6C242F.8040704@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard skrev:
>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>>>>>>             
>
> Hi,
>
>  Ulf> In the openembedded project all the developers have
>  Ulf> write access to the development tree and can create
>  Ulf> their own branches within the tree.
>
>  Ulf> This makes it a lot easier to test other peoples patches.
>
> I don't agree, typing git add remove <foo> is trivial. That's the
> glory of the distributed nature of git.
>
>  Ulf> If you look at the statistics for the user repositories,
>  Ulf> you see that there are 5 people with user repositories,
>  Ulf> including mine, and last updates were from
>
>  Ulf> correa:          3 months ago,
>  Ulf> wberrier:       2 months ago,
>  Ulf> tpetazzoni:   9 days ago
>  Ulf> ulf:                 33 hours ago
>  Ulf> jacmet:         -
>
> which corresponds pretty nicely with the list of active developers:
>
> git shortlog -s -n 2009.05..
>     73  Peter Korsgaard
>     31  Thomas Petazzoni
>      9  Maxim Grigoriev
>      8  Will Newton
>      7  Sven Neumann
>      5  Gustavo Zacarias
>      4  Nigel Kukard
>      2  Bernhard Reutner-Fischer
>      2  Daniel Mack
>      2  Ulf Samuelsson
>      1  Alex Dobrynin
>      1  Evan Zelkowitz
>      1  H Hartley Sweeten
>      1  Lionel Landwerlin
>      1  Markus Heidelberg
>      1  Pwalters
>      1  laurent laffont
>
> Bernhard has his repo on repo.or.cz for historical reasons.
>
>  Ulf> This does not indicate a high level of popularity to me.
>  Ulf> Maybe people are keeping trees in other locations, but
>  Ulf> that means that they are hidden from most users.
>
> No, it indicates that buildroot is a small project with limited amount
> of active developers (and luckily a lot of outside contributers).
>
>  Ulf> In reality, the way Buildroot works today seems to be that
>  Ulf> people are sending patches to the mailing-list.
>
> And that's exactly what they should do. We *WANT* to see the patches
> on the mailing list so they can get reviewed.
>   
I do not see a contracdiction here.
You can have multiple persons work on one thing, and
once it is ready, the patches can be automatically
generated and sent to the mailing list.

What is the drawback of letting people work together
by allowing them to share a git.

People can share a git anyway, by using another git server,
but that makes it less visible to Buildroot users, so I would
like to avoid that.

> We also don't want to require outsiders to learn git in order to
> contribute patches.
>   
It it very different to require people to learn git, from
blocking people that wants to use git, to work together.

BR
Ulf Samuelsson
