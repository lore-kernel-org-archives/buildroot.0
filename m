From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 15:31:31 +0200
Subject: [Buildroot] [PATCH v3 02/37] package/expedite: move to package
 directory
In-Reply-To: <20151010145556.59b3543c@free-electrons.com>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
 <1444471422-15118-3-git-send-email-romain.naour@openwide.fr>
 <20151010125428.002de0af@free-electrons.com> <561907F7.5070308@openwide.fr>
 <20151010145556.59b3543c@free-electrons.com>
Message-ID: <56191333.6030607@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 10/10/2015 14:55, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sat, 10 Oct 2015 14:43:35 +0200, Romain Naour wrote:
> 
>> "We usually do not have a sub-directory for a family of related packages, so
>> move expedite to package directory.
> 
> This is not exactly true. When they need to share the same version
> number (example: qt5), then we do have a sub-directory for a family of
> related packages. So I think this should be reworded a bit.

IIRC the sentence has been borrowed from a commit log from matchbox series
http://git.buildroot.net/buildroot/commit/?id=3b468acbb4ec2aca748fc022ff0d53a530b3264b

Yann, no offense :)

I think there is no advantage for efl related packages to share the same version
number anymore, Except maybe for efl and libelementary...

See: https://www.enlightenment.org/download

EFL			1.15.2
Elementary		1.15.2
Emotion Generic Players	1.15.0
Evas Generic Loaders	1.15.0
Python-EFL		1.15.0

expedite is downloaded from the 1.15 branch in the git repository

> 
>>> Also, it seems like you don't have rename detection enabled in Git.
>>
>> Indeed, sorry for that... The patch generated with git format-patch didn't look
>> like the one viewed through gitk.
>> I fixed that using:
>> git config --global diff.renames copies
>>
>> Also the following patches moving efl packages to package directory have the
>> same issue...
> 
> Perfect. It will indeed make the review easier.

Thanks for noticing it.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
