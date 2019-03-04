From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Mar 2019 08:20:11 +0100
Subject: [Buildroot] Python 2.7 end of life on January 1, 2020
In-Reply-To: <20190301195404.1c00356b@windsurf>
References: <20190301195404.1c00356b@windsurf>
Message-ID: <506b3ab3-1450-d7c6-56aa-a5bea1a88353@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/03/2019 19:54, Thomas Petazzoni wrote:
> Hello,
> 
> Through a LWN.net article, I recently realized that Python 2.7 will see
> its end of life on January 1, 2020, according to:
> 
>   https://www.python.org/dev/peps/pep-0373/
> 
> You also have a fancy countdown at:
> 
>   https://pythonclock.org/
> 
> This means that our 2020.02 LTS release probably should not have Python
> 2.x anymore ?

 I don't know. We don't usually terminate a package just because it's EOL.
Remember, we have plenty of packages with dead upstreams. Or take Qt 5.6 for
example: it's been EOL for how long now?

 In addition, as opposed to Qt5.6 for example, distros (Debian and Redhat) will
keep on maintaining it for a few years still.

 So I'd say: as long as it doesn't cause breakage, keep it. Definitely as long
as there are other packages depending on it (Kodi...).

 I expect we'll remove it some time during 2020 to make sure it's no longer in
the 2021.02 LTS.

 Regards,
 Arnout

> 
> If that's our decision, then we should probably discuss the deprecation
> path we want to follow to strongly warn users that they should migrate
> away from Python 2.x.
> 
> What do people think about this ?
> 
> Best regards,
> 
> Thomas
> 
