From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Oct 2019 15:43:16 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/netopeer2-keystored: add
 package
In-Reply-To: <20191009153454.1f5f3e09@windsurf> (Thomas Petazzoni's message of
 "Wed, 9 Oct 2019 15:34:54 +0200")
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-8-heiko.thiery@gmail.com>
 <20191009141235.016e4b23@windsurf>
 <CAEyMn7a2w8vXSqHHmHtKmkn8okGVdOq=XSsbRaYtG_bOJ6T0hA@mail.gmail.com>
 <20191009153454.1f5f3e09@windsurf>
Message-ID: <875zky11cb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,
 > In the light of this in the end, perhaps it makes sense to have three
 > packages like you did. It kind of reflects the fact that even though
 > they are stored in the same Git repo, they are three independent
 > components each with its own build system.

 > Peter, Arnout, Yann, any thoughts ? See
 > https://github.com/CESNET/Netopeer2 for the code base.

Yes, that indeed seems the best solution to me as well.

-- 
Bye, Peter Korsgaard
