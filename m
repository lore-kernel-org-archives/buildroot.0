From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Aug 2013 10:28:36 -0300
Subject: [Buildroot] [PATCH 2/5] acl: add patch to fix static
	installation
In-Reply-To: <1376996584-4462-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996584-4462-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52176384.8090401@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/20/2013 08:03 AM, Thomas Petazzoni wrote:

> Just like 'attr', 'acl' doesn't use automake to control the
> build/installation of its components, and the static-only installation
> process was not installing libacl.a. We add a patch that fixes this.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
