From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Oct 2019 21:46:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-docker: bump to version
 4.1.0
In-Reply-To: <CALFsTFXWkm00V-btf=o8GDjqxV7r-4pNzTH6xP91AqkNDSVUWw@mail.gmail.com>
 (Asaf Kahlon's message of "Wed, 23 Oct 2019 22:20:20 +0300")
References: <20191021134031.20586-1-asafka7@gmail.com>
 <20191021134031.20586-3-asafka7@gmail.com>
 <87d0en79n7.fsf@dell.be.48ers.dk>
 <CALFsTFXWkm00V-btf=o8GDjqxV7r-4pNzTH6xP91AqkNDSVUWw@mail.gmail.com>
Message-ID: <87wocv5joi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:

Hi,

 >> install_requires = [
 >> ..
 >> 'docker >= 3.1.4, < 4.0',
 >> 
 >> Will you send a version bump for docker-compose as well? We have a
 >> runtime test for it.

 > Actually, now I see the even the latest docker-compose version (1.24.1) requires
 > docker < 4.0...
 > Maybe we should take an rc-version that support it (1.25.0-rc2)?

Or revert the docker bump. Is there any specific reason you need the new
docker-python version?

I see we have the same issue with your recent python-pyyaml bump :/

-- 
Bye, Peter Korsgaard
