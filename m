From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 06 May 2013 08:34:58 -0300
Subject: [Buildroot] [PATCH 1/3] python-setuptools: forkbump and add
 workaround for shebang
In-Reply-To: <87k3ncjqfh.fsf@dell.be.48ers.dk>
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
 <516CEF3C.6070505@mind.be> <516D254A.4010707@zacarias.com.ar>
 <87a9o8lfy6.fsf@dell.be.48ers.dk> <51878F08.2030804@zacarias.com.ar>
 <87k3ncjqfh.fsf@dell.be.48ers.dk>
Message-ID: <51879562.9090801@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/2013 08:30 AM, Peter Korsgaard wrote:
> Hmm, odd - They built fine here:

My bad, those are python distutils-based which has the --executable
functionality builtin (yes, there's more than one way of
building/installing modules in python, yes, it hurts).
Regards.
